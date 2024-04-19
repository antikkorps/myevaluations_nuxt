<script setup lang="ts">
const { user, cookies, session } = useAuth()
const props = defineProps({
  size: {
    type: String,
    default: "md",
  },
})
</script>
<template>
  <div class="flex justify-center items-center cursor-pointer">
    <nuxt-link to="/profile">
      <UAvatar
        :size="props.size"
        :src="session?.user?.avatar"
        alt="Avatar"
        class="mx-2 pt-3 justify-center items-center"
      />
    </nuxt-link>
  </div>
</template>
