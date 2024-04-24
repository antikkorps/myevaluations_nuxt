<script setup lang="ts">
import { LetterCaseCapitalizeIcon } from "@radix-icons/vue"
import type { FieldType } from "~/types/formsTypes"
import draggable from "vuedraggable"

import { ref } from "vue"
import InputTypeButton from "./ui/InputTypeButton.vue"

const fields = ref<FieldType[]>([])
const formTitle = ref("")

const addField = (type: string) => {
  fields.value.push({
    type,
    label: "",
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

const meals = ref(["Hamburger", "Pizza", "Spaghetti", "Tacos", "Teriyaki Chicken"])

const removeField = (index: number) => {
  fields.value.splice(index, 1)
}

const addOption = (index: number) => {
  fields.value[index].options.push("")
}

const removeOption = (fieldIndex: number, optionIndex: number) => {
  fields.value[fieldIndex].options.splice(optionIndex, 1)
}

const submitForm = () => {
  // Submit the form
  console.log(fields.value)
}
</script>

<template>
  <div class="flex">
    <div class="w-1/3 dark:bg-neutral-900 bg-neutral-300 py-4 h-auto items-center">
      <InputTypeButton
        v-for="(button, index) in addFormElements"
        :key="index"
        :label="button.label"
        :description="button.description"
        :icon="button.icon"
        :type="button.type"
        @add-field="addField"
        class="ml-1"
      />
    </div>
    <div class="w-2/3 mx-auto justify-center items-center">
      <div>
        <UInput
          v-model="formTitle"
          placeholder="Donner un titre au formulaire"
          class="mb-4"
        />
        <div v-for="(field, index) in fields" :key="`field-${index}`">
          <!-- The rest of your form builder code goes here -->
        </div>
        <UButton color="primary" variant="solid" @click="submitForm"
          >Sauvegarder le formulaire</UButton
        >
      </div>
      <draggable v-model="meals" tag="ul" :itemKey="(meal) => meals.indexOf(meal)">
        <template #item="{ element: meal }">
          <li>{{ meal }}</li>
        </template>
      </draggable>
    </div>
  </div>
</template>
