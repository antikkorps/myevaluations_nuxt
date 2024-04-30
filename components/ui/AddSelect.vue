<script setup lang="ts">
import type { FieldType, OptionType } from "~/types/formsTypes"
const props = defineProps({
  field: {
    type: Object,
    required: true,
  },
  removeField: Function,
  addField: Function,
  index: Number,
})
const fields = ref<FieldType[]>([])

const addOption = (field: FieldType) => {
  if (!Array.isArray(field.options)) {
    field.options = []
  }
  field.options.push({ value: "", label: "", validated: false })
}

const validateOption = (option: OptionType) => {
  option.validated = true
}

const removeOption = (fieldIndex: number, optionIndex: number) => {
  fields.value[fieldIndex].options.splice(optionIndex, 1)
  fields.value[fieldIndex].options = [...fields.value[fieldIndex].options]
}
</script>
<template>
  <div class="flex flex-row w-full space-x-2">
    <div class="w-10">
      <Icon
        name="ph:dots-six-vertical-bold"
        class="h-8 w-8 border border-spacing-2 rounded-lg"
      />
    </div>
    <UPopover overlay>
      <UButton
        color="white"
        label="Définir les options"
        trailing-icon="i-heroicons-chevron-down-20-solid"
      />

      <template #panel="{ close }">
        <div class="p-8">
          <div
            v-for="(option, optionIndex) in field.options"
            :key="`option-${optionIndex}`"
          >
            <div class="flex justify-center mx-auto py-3 space-x-3">
              <UInput v-model="option.value" placeholder="Valeur" />
              <UInput v-model="option.label" placeholder="Libellé" />
            </div>
            <UButton
              v-if="option.validated"
              @click="index !== undefined && removeOption(index, optionIndex)"
            >
              Supprimerl'option
            </UButton>
            <UButton v-else @click="validateOption(option)">Valider l'option</UButton>
          </div>
          <div class="my-4">
            <UButton @click="addOption(field as FieldType)"
              ><Icon name="ion:add"
            /></UButton>
          </div>
          <div>
            <UButton label="Fermer la fenêtre" @click="close" />
          </div>
        </div>
      </template>
    </UPopover>

    <USelect v-model="field.value" :name="field.name" :options="field.options" />
    <UiDeleteFieldButton :removeField="removeField" />
  </div>
</template>
