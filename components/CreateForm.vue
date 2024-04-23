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
    type: type,
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
    icon: LetterCaseCapitalizeIcon,
    type: "text",
  },
  {
    label: "Number input",
    description: "A number",
    icon: LetterCaseCapitalizeIcon,
    type: "number",
  },
  {
    label: "Date input",
    description: "A date",
    icon: LetterCaseCapitalizeIcon,
    type: "date",
  },
  {
    label: "Select input",
    description: "A dropdown",
    icon: LetterCaseCapitalizeIcon,
    type: "select",
  },
  {
    label: "Radio input",
    description: "A radio button",
    icon: LetterCaseCapitalizeIcon,
    type: "radio",
  },
  {
    label: "Checkbox input",
    description: "A checkbox",
    icon: LetterCaseCapitalizeIcon,
    type: "checkbox",
  },
  {
    label: "Textarea input",
    description: "A multi-line text input",
    icon: LetterCaseCapitalizeIcon,
    type: "textarea",
  },
  {
    label: "File input",
    description: "A file upload",
    icon: LetterCaseCapitalizeIcon,
    type: "file",
  },
  {
    label: "Email input",
    description: "An email address",
    icon: LetterCaseCapitalizeIcon,
    type: "email",
  },
  {
    label: "Phone input",
    description: "A phone number",
    icon: LetterCaseCapitalizeIcon,
    type: "phone",
  },
  {
    label: "Password input",
    description: "A password",
    icon: LetterCaseCapitalizeIcon,
    type: "password",
  },
  {
    label: "Color input",
    description: "A color",
    icon: LetterCaseCapitalizeIcon,
    type: "color",
  },
  {
    label: "Time input",
    description: "A time",
    icon: LetterCaseCapitalizeIcon,
    type: "time",
  },
  {
    label: "Range input",
    description: "A range",
    icon: LetterCaseCapitalizeIcon,
    type: "range",
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
    <div
      class="w-1/3 dark:bg-neutral-900 bg-neutral-300 py-4"
      :style="{ height: 'calc(100vh - 80px)' }"
    >
      <InputTypeButton
        v-for="(button, index) in addFormElements"
        :key="index"
        :label="button.label"
        :description="button.description"
        :icon="button.icon"
        :type="button.type"
        @add-field="addField"
      />
      <button
        class="flex justify-center items-center py-4 px-2"
        @click="addField('text')"
      >
        <div class="h-10 w-10 bg-amber-50 mr-2"></div>
        <div class="text-2xl">Text input</div>
        <div class="text-2xs">A single ligne of text</div>
      </button>
      <button @click="addField('number')">Add Number Field</button>
      <button @click="addField('date')">Add Date Field</button>
      <button @click="addField('select')">Add Select Field</button>
      <!-- Add more buttons as needed -->
    </div>
    <div class="w-2/3">
      <input v-model="formTitle" placeholder="Form Title" class="mb-4" />
      <div v-for="(field, index) in fields" :key="`field-${index}`">
        <!-- The rest of your form builder code goes here -->
      </div>
      <button @click="submitForm">Submit Form</button>
    </div>
    <draggable v-model="meals" tag="ul" :itemKey="(meal) => meals.indexOf(meal)">
      <template #item="{ element: meal }">
        <li>{{ meal }}</li>
      </template>
    </draggable>
  </div>
</template>
