<script setup lang="ts">
const props = defineProps({
  options: {
    type: Array,
    required: true,
  },
  addField: {
    type: Function,
    required: true,
  },
})

const fieldOptions = ["texte", "nombre", "date", "heure", "liste"]

const fieldOption = ref(fieldOptions[0])
</script>

<template>
  <div>
    <UPopover overlay>
      <UButton color="white" label="+" />
      <template #panel="{ close }">
        <div class="p-8">
          <USelect
            v-model="fieldOption"
            :options="fieldOptions"
            @click="addField(fieldOption)"
          />
          <UButton label="Retour" @click="close" class="my-2" />
        </div>
      </template>
    </UPopover>
  </div>
</template>
