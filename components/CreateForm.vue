<script setup lang="ts">
import type { FieldType } from "~/types/formsTypes"
import { ref } from "vue"

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
    <div class="w-1/4">
      <button @click="addField('text')">Add Text Field</button>
      <button @click="addField('number')">Add Number Field</button>
      <button @click="addField('date')">Add Date Field</button>
      <button @click="addField('select')">Add Select Field</button>
      <!-- Add more buttons as needed -->
    </div>
    <div class="w-3/4">
      <input v-model="formTitle" placeholder="Form Title" class="mb-4" />
      <div v-for="(field, index) in fields" :key="`field-${index}`">
        <!-- The rest of your form builder code goes here -->
      </div>
      <button @click="submitForm">Submit Form</button>
    </div>
  </div>
</template>
