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
  addField: {
    type: Function,
    required: true,
  },
  index: {
    type: Number,
    required: true,
  },
})

const emit = defineEmits(["add-field"])

function addField(option: string) {
  const newField = {
    type: option,
    label: "",
    value: "",
    name: `field_${props.field.length + 1}`,
  }
  props.addField(props.inputType, props.index + 1)
  console.log(props.inputType)
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
      <UiAddField @add-field="addField" />
    </div>
  </div>
</template>
