<script setup lang="ts">
const fields = ref([])

const addField = () => {
  fields.value.push({ type: "text", label: "", value: "", options: [] })
}

const removeField = (index) => {
  fields.value.splice(index, 1)
}

const addOption = (index) => {
  fields.value[index].options.push("")
}

const removeOption = (fieldIndex, optionIndex) => {
  fields.value[fieldIndex].options.splice(optionIndex, 1)
}

const submitForm = () => {
  // Submit the form
}
</script>
<template>
  <div>
    <div v-for="(field, index) in fields" :key="`field-${index}`">
      <select v-model="field.type">
        <option value="text">Text</option>
        <option value="number">Number</option>
        <option value="date">Date</option>
        <option value="select">Select</option>
        <!-- Add more options as needed -->
      </select>
      <input v-model="field.label" placeholder="Label" />
      <input v-model="field.value" placeholder="Value" v-if="field.type !== 'select'" />
      <div v-if="field.type === 'select'">
        <button @click="addOption(index)">Add Option</button>
        <div
          v-for="(option, optionIndex) in field.options"
          :key="`option-${optionIndex}`"
        >
          <input v-model="fields[index].options[optionIndex]" placeholder="Option" />
          <button @click="removeOption(index, optionIndex)">Remove Option</button>
        </div>
      </div>
      <button @click="removeField(index)">Remove Field</button>
    </div>
    <button @click="addField">Add Field</button>
    <button @click="submitForm">Submit</button>
  </div>
</template>
