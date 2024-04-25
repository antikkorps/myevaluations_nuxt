<script setup lang="ts">
const props = defineProps({
  field: {
    type: Object,
    required: true,
  },
  removeField: Function,
})
</script>
<template>
  <UInput
    icon="i-heroicons-pencil"
    placeholder="Entrez le titre du champ"
    v-model="field.placeholder"
    class="mb-2"
  />
  <UInput
    type="text"
    v-model="field.value"
    :name="field.name"
    :placeholder="field.placeholder"
  />
  <UiDeleteFieldButton :removeField="removeField" />
</template>
