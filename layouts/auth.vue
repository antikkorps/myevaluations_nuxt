<template>
  <div>
    <div class="flex flex-col w-full sm:w-1/2 mx-auto px-3">
      <nuxt-link to="/"
        ><UButton>
          <i class="i-heroicons-arrow-uturn-left"></i>
          Retour accueil</UButton
        ></nuxt-link
      >
      <slot />
    </div>
  </div>
</template>
