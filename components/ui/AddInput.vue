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

function addField(option) {
  console.log(option)
}
</script>
<template>
  <div>
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
          <UInput
            :type="inputType"
            v-model="field.value"
            :name="field.name"
            :placeholder="inputType"
          />
          <UiDeleteFieldButton :removeField="removeField" />
        </div>
      </UFormGroup>
    </div>
    <div class="flex justify-center items-center mx-auto">
      <UiAddField :options="fieldOptions" :add-field="addField" />
    </div>
  </div>
</template>
