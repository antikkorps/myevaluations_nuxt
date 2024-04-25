<script setup lang="ts">
const fieldOptions = ["texte", "nombre", "date", "heure", "liste"]

const fieldOption = ref(fieldOptions[0])

const emit = defineEmits(["add-field"])
const emitAddField = () => {
  emit("add-field", fieldOption.value)
}
</script>

<template>
  <div>
    <UPopover overlay>
      <UButton color="white" label="+" />
      <template #panel="{ close }">
        <div class="p-8">
          <USelect v-model="fieldOption" :options="fieldOptions" @click="emitAddField" />
          <UButton label="Retour" @click="close" class="my-2" />
        </div>
      </template>
    </UPopover>
  </div>
</template>
