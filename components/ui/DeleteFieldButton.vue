<script setup lang="ts">
const props = defineProps({ removeField: Function })
</script>
<template>
  <UButton size="lg" @click="removeField">
    <Icon name="mdi:trash-can-outline" />
  </UButton>
</template>
