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
const inputType = reactive(new Array(props.field.length).fill(props.inputType))

const emit = defineEmits(["add-field"])

const addField = (option: string, index: number) => {
  const newField = {
    type: option,
    label: "",
    value: "",
    name: `field_${props.field.length + 1}`,
  }
  props.addField(option, index)
  console.log(option)
  inputType.push(option)
}

const updateInputType = (newInputType: string, index: number) => {
  inputType[index] = newInputType
  addField(inputType[index], props.index + 1)
}
</script>
<template>
  <div>
    <div class="flex flex-row items-center space-x-2 py-2">
      <div class="w-10">
        <Icon
          name="ph:dots-six-vertical-bold"
          class="h-8 w-8 border border-spacing-2 rounded-lg"
        />
      </div>
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
      <UiAddField @add-field="updateInputType" />
    </div>
  </div>
</template>
