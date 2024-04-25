<script setup lang="ts">
const props = defineProps({
  field: {
    type: Object,
    required: true,
  },
  removeField: Function,
  inputType: {
    type: String,
    required: true,
  },
})
</script>
<template>
  <div class="flex flex-row items-center space-x-2 py-2">
    <UFormGroup label="Entrez le titre du champ">
      <UInput
        variant="none"
        icon="i-heroicons-pencil"
        placeholder="Entrez le titre du champ"
        v-model="field.label"
      />
    </UFormGroup>

    <UFormGroup :label="field.label">
      <div class="flex flex-row space-x-2">
        <UInput :type="inputType" v-model="field.value" :name="field.name" />
        <UiDeleteFieldButton :removeField="removeField" />
      </div>
    </UFormGroup>
  </div>
</template>
