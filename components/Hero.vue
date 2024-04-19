<template>
  <div class="w-full flex justify-center items-center h-[calc(100vh-80px)]">
    <div class="text-center">
      <div class="max-w-md">
        <h1 class="text-5xl font-bold">Bienvenue sur le site MyEvaluation</h1>
        <p class="py-6">
          Pour évaluer tout ce que vous souhaitez comme vous le souhaitez et le partager
          facilement.
        </p>
        <div class="w-full flex justify-center">
          <NuxtLink to="/login">
            <UButton color="primary" variant="solid" class="mx-2"
              >Se connecter</UButton
            ></NuxtLink
          >
          <UButton color="primary" variant="link" class="mx-2">En Savoir plus</UButton>
        </div>
      </div>
    </div>
  </div>
</template>
