<script setup lang="ts">
const props = defineProps({ removeField: Function })
</script>
<template>
  <div class="flex flex-row">
    <UButton @click="removeField">
      <Icon name="mdi:trash-can-outline" />
    </UButton>
  </div>
</template>
