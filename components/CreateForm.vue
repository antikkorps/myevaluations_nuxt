<script setup lang="ts">
import type { FieldType, OptionType } from "~/types/formsTypes"

import { ref } from "vue"
import InputTypeButton from "./ui/InputTypeButton.vue"

const fields = ref<FieldType[]>([])
const formTitle = ref("")

const addField = (type: string, newField: FieldType) => {
  fields.value.push({
    type,
    label: "",
    placeholder: "",
    value: "",
    options: [],
    name: "",
    required: false,
    unique: false,
    ref: "",
  })
}

const addFormElements = [
  {
    label: "Text input",
    description: "A single line of text",
    icon: "ph:text-aa",
    type: "text",
  },
  {
    label: "Number input",
    description: "A number",
    icon: "bi:123",
    type: "number",
  },
  {
    label: "Date input",
    description: "A date",
    icon: "mdi:calendar-month-outline",
    type: "date",
  },
  {
    label: "Time input",
    description: "A time",
    icon: "material-symbols:alarm",
    type: "time",
  },
  {
    label: "Select input",
    description: "A dropdown",
    icon: "octicon:single-select-24",
    type: "select",
  },
  {
    label: "Radio input",
    description: "A radio button",
    icon: "ic:sharp-radio-button-checked",
    type: "radio",
  },
  {
    label: "Checkbox input",
    description: "A checkbox",
    icon: "memory:checkbox-marked",
    type: "checkbox",
  },
  {
    label: "Textarea input",
    description: "A multi-line text input",
    icon: "fluent:text-align-left-16-regular",
    type: "textarea",
  },
  {
    label: "File input",
    description: "A file upload",
    icon: "icon-park-outline:upload",
    type: "file",
  },
  {
    label: "Email input",
    description: "An email address",
    icon: "ic:round-alternate-email",
    type: "email",
  },
  {
    label: "Phone input",
    description: "A phone number",
    icon: "material-symbols:call-outline-rounded",
    type: "phone",
  },
  {
    label: "Color input",
    description: "A color",
    icon: "material-symbols:format-color-fill",
    type: "color",
  },

  {
    label: "Range input",
    description: "A range",
    icon: "lucide:sliders-horizontal",
    type: "range",
  },
  {
    label: "star input",
    description: "A star rating",
    icon: "mdi:star",
    type: "star",
  },
]

const removeField = (index: number) => {
  fields.value.splice(index, 1)
}

const addOption = (field: FieldType) => {
  if (!Array.isArray(field.options)) {
    field.options = []
  }
  field.options.push({ value: "", label: "", validated: false })
}

const validateOption = (option: OptionType) => {
  option.validated = true
}

const removeOption = (fieldIndex: number, optionIndex: number) => {
  fields.value[fieldIndex].options.splice(optionIndex, 1)
  fields.value[fieldIndex].options = [...fields.value[fieldIndex].options]
}

const submitForm = () => {
  // Submit the form
  console.log(fields.value)
}
</script>

<template>
  <div class="flex w-full">
    <div class="w-1/3 dark:bg-neutral-900 bg-neutral-300 py-4 h-auto items-center">
      <InputTypeButton
        v-for="(button, index) in addFormElements"
        :name="`field-${index}`"
        :key="index"
        :label="button.label"
        :description="button.description"
        :icon="button.icon"
        :type="button.type"
        @add-field="addField"
      />
    </div>
    <div class="w-2/3 mx-auto justify-center items-center">
      <div class="flex flex-col w-full mx-auto sm:w-4/5 justify-center">
        <UInput
          v-model="formTitle"
          placeholder="Donnez un titre au formulaire"
          class="mb-4"
        />
        <div v-for="(field, index) in fields" :key="`field-${index}`">
          <UiAddInput
            v-if="field.type === 'text'"
            :field="field"
            :removeField="() => removeField(index)"
            inputType="text"
            :addField="addField"
          />
          <UiAddInput
            v-if="field.type === 'number'"
            :field="field"
            :removeField="() => removeField(index)"
            inputType="number"
            :addField="addField"
          />

          <UInput
            v-if="field.type === 'date'"
            :field="field"
            :removeField="() => removeField(index)"
            inputType="date"
          />
          <UInput
            v-if="field.type === 'time'"
            :field="field"
            :removeField="() => removeField(index)"
            inputType="time"
          />
          <div v-if="field.type === 'select'">
            <USelect
              type="select"
              v-model="field.value"
              :name="field.name"
              :options="field.options"
            />

            <UPopover overlay>
              <UButton
                color="white"
                label="Choisir les options"
                trailing-icon="i-heroicons-chevron-down-20-solid"
              />

              <template #panel="{ close }">
                <div class="p-8">
                  <div
                    v-for="(option, optionIndex) in field.options"
                    :key="`option-${optionIndex}`"
                  >
                    <div class="flex justify-center mx-auto py-3">
                      <UInput v-model="option.value" placeholder="Valeur" />
                      <UInput v-model="option.label" placeholder="Libellé" />
                    </div>
                    <UButton
                      v-if="option.validated"
                      @click="removeOption(index, optionIndex)"
                    >
                      Supprimerl'option
                    </UButton>
                    <UButton v-else @click="validateOption(option)"
                      >Valider l'option</UButton
                    >
                  </div>
                  <div>
                    <UButton @click="addOption(field)"></UButton>
                  </div>
                  <div>
                    <UButton label="Fermer la fenêtre" @click="close" />
                  </div>
                </div>
              </template>
            </UPopover>
          </div>
          <UInput
            v-if="field.type === 'radio'"
            type="radio"
            v-model="field.value"
            :name="field.name"
          />
          <UInput
            v-if="field.type === 'checkbox'"
            type="checkbox"
            v-model="field.value"
            :name="field.name"
          />
          <UInput
            v-if="field.type === 'textarea'"
            type="textarea"
            v-model="field.value"
            :name="field.name"
          />
          <UInput
            v-if="field.type === 'file'"
            type="file"
            v-model="field.value"
            :name="field.name"
          />
          <UInput
            v-if="field.type === 'email'"
            type="email"
            v-model="field.value"
            :name="field.name"
          />
          <UInput
            v-if="field.type === 'phone'"
            type="phone"
            v-model="field.value"
            :name="field.name"
          />
          <UInput
            v-if="field.type === 'color'"
            type="color"
            v-model="field.value"
            :name="field.name"
          />
          <URange
            v-if="field.type === 'range'"
            type="range"
            v-model="field.value"
            :name="field.name"
            :min="0"
            :max="100"
            :model-value="0"
            :step="10"
          />
          <UInput
            v-if="field.type === 'star'"
            type="star"
            v-model="field.value"
            :name="field.name"
          />
        </div>
        <div class="flex flex-row w-full sm:w-2/5 justify-end mt-4">
          <UButton class="w-full" color="primary" variant="solid" @click="submitForm"
            >Sauvegarder le formulaire</UButton
          >
        </div>
      </div>
    </div>
  </div>
</template>
