<script setup lang="ts">
import type { FieldType, OptionType } from "~/types/formsTypes"

import { ref } from "vue"

const fields = ref<FieldType[]>([])
const formTitle = ref("")

const addField = (type: string, index?: number) => {
  const newField = {
    type,
    label: "",
    placeholder: "",
    value: "",
    options: [],
    name: "",
    required: false,
    unique: false,
    ref: "",
  }
  if (index !== undefined) {
    fields.value.splice(index, 0, newField)
  } else {
    fields.value.push(newField)
  }
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

// const addOption = (field: FieldType) => {
//   if (!Array.isArray(field.options)) {
//     field.options = []
//   }
//   field.options.push({ value: "", label: "", validated: false })
// }

const checkMove = (evt: {
  relatedContext: { component: { options: { type: string } } }
}) => {
  // return evt.relatedContext.component.options.type !== "select"
  console.log(evt.relatedContext.component.options.type)
}

// const validateOption = (option: OptionType) => {
//   option.validated = true
// }

// const removeOption = (fieldIndex: number, optionIndex: number) => {
//   fields.value[fieldIndex].options.splice(optionIndex, 1)
//   fields.value[fieldIndex].options = [...fields.value[fieldIndex].options]
// }

const submitForm = () => {
  // Submit the form
  console.log(fields.value)
}
</script>

<template>
  <div class="flex w-full">
    <div
      class="hidden sm:block sm:w-1/3 max-w-sm dark:bg-neutral-900 bg-neutral-300 py-4 h-auto items-center"
    >
      <UiInputTypeButton
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

    <div class="w-full sm:w-2/3 mx-auto justify-center items-center">
      <div class="flex flex-col w-full mx-auto mt-10 sm:w-4/5 justify-center">
        <UInput
          v-model="formTitle"
          placeholder="Donnez un titre au formulaire"
          class="mb-4"
        />
        <div>
          <UiAddField @add-field="addField" class="w-full flex justify-center mx-auto" />
        </div>
        <draggable v-model="fields" :move="checkMove">
          <div v-for="(field, index) in fields" :key="`field-${index}`">
            <UiAddInput
              v-if="field.type === 'text'"
              :field="field"
              :removeField="() => removeField(index)"
              inputType="text"
              :addField="addField"
              :index="index"
            />
            <UiAddInput
              v-if="field.type === 'number'"
              :field="field"
              :removeField="() => removeField(index)"
              inputType="number"
              :addField="addField"
              :index="index"
            />

            <UiAddInput
              v-if="field.type === 'date'"
              :field="field"
              :removeField="() => removeField(index)"
              inputType="date"
              :addField="addField"
              :index="index"
            />
            <UiAddInput
              v-if="field.type === 'time'"
              :field="field"
              :removeField="() => removeField(index)"
              inputType="time"
              :addField="addField"
              :index="index"
            />

            <UiAddSelect
              v-if="field.type === 'select'"
              :field="field"
              :removeField="() => removeField(index)"
              :addField="addField"
              :index="index"
            />

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
              :step="10"
            />
            <UInput
              v-if="field.type === 'star'"
              type="star"
              v-model="field.value"
              :name="field.name"
            />
          </div>
        </draggable>
        <div class="flex flex-row w-full mx-auto sm:w-2/5 justify-end mt-4">
          <UButton
            class="w-1/2 flex mx-auto justify-center sm:w-full"
            color="primary"
            variant="solid"
            @click="submitForm"
            >Sauvegarder le formulaire</UButton
          >
        </div>
      </div>
    </div>
  </div>
</template>
