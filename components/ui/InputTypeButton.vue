<script setup lang="ts">
const props = defineProps({
  icon: {
    type: String,
    required: true,
  },
  label: {
    type: String,
    required: true,
  },
  description: {
    type: String,
    required: true,
  },
  type: {
    type: String,
    required: true,
  },
})

const emit = defineEmits(["addField"])

const clickHandler = () => {
  emit("addField", props.type)
}
</script>
<template>
  <button
    class="flex justify-start items-center py-4 px-2 border border-stone-100 dark:border-neutral-800 w-full"
    @click="clickHandler"
  >
    <div class="h-10 w-10 bg-neutral-800 mr-2 flex justify-center items-center">
      <Icon :name="icon" class="w-6 h-6 text-white" />
    </div>
    <div class="flex flex-col justify-start text-start">
      <div class="text">{{ label }}</div>
      <div class="text-sm">{{ description }}</div>
    </div>
  </button>
</template>
