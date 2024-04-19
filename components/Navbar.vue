<script setup lang="ts">
const { signIn, signOut, session, status, user, cookies, getProviders } = useAuth()

const route = useRoute()

const showMenu = ref(false)
let menuMobile: HTMLElement | null = null

const handleMobileMenu = () => {
  showMenu.value = !showMenu.value
  nextTick(() => {
    if (showMenu.value) {
      document.body.style.overflow = "hidden"
    } else {
      document.body.style.overflow = ""
    }
  })
}

const links = [
  {
    label: "Accueil",
    icon: "i-heroicons-home",
    to: "/",
  },

  {
    label: "A propos",
    icon: "i-heroicons-command-line",
    to: "/about",
  },
  {
    label: "Examples",
    icon: "i-heroicons-light-bulb",
    to: "/",
  },
  {
    label: "Help",
    icon: "i-heroicons-question-mark-circle",
    to: "/",
  },
]

onMounted(() => {
  menuMobile = document.querySelector(".menuMobile")
})
</script>
<template>
  <div>
    <div
      class="w-full relative top-0 h-20 bg-slate-100 dark:bg-neutral-900 flex flex-row justify-around items-center mb-5"
    >
      <div class="sm:hidden">
        <button @click="handleMobileMenu" class="flex items-center">
          <i
            class="i-heroicons-bars-3 w-6 h-6 mr-4 transition-transform duration-500 ease-in-out"
            :class="{ 'transform rotate-180': showMenu, 'transform rotate-0': !showMenu }"
          ></i>
          menu
        </button>
      </div>
      <div>logo</div>

      <div class="hidden sm:block">
        <NuxtLink
          v-for="(link, index) in links"
          :key="`link-${index}`"
          :to="link.to"
          class="mr-4"
        >
          <i :class="link.icon" class="w-4 h-4"></i>
          {{ link.label }}
        </NuxtLink>
      </div>

      <div class="flex items-center">
        <ColorMode />
        <div v-if="session" class="flex justify-center items-center mx-auto">
          <UiAvatar class="hidden sm:block" />
          <UiLogoutButton />
        </div>

        <UiLoginButton v-else />
      </div>
    </div>
    <transition name="slide">
      <div
        v-show="showMenu"
        class="menuMobile absolute top-0 left-0 w-full h-screen bg-white dark:bg-neutral-900 z-50 flex flex-col"
      >
        <button
          @click="handleMobileMenu"
          class="flex justify-left relative left-4 top-2 items-center my-5"
        >
          <i
            class="i-heroicons-x-mark w-6 h-6 transition-transform ease-in-out"
            :class="{
              'transform rotate-180 duration-500 delay-200': showMenu,
              'transform rotate-0': !showMenu,
            }"
          ></i>
        </button>
        <div class="flex my-auto items-center">
          <div class="flex flex-col w-full justify-center items-center align-middle">
            <NuxtLink
              v-for="(link, index) in links"
              :key="`link-${index}`"
              :to="link.to"
              @click="handleMobileMenu"
              class="my-4 mx-auto text-2xl align-middle flex items-center justify-center"
            >
              <i :class="link.icon" class="w-6 h-6 mr-3"></i>
              {{ link.label }}
            </NuxtLink>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>
<style scoped>
.slide-enter-active,
.slide-leave-active {
  transition: transform 0.5s ease-in-out;
}

.slide-enter-from,
.slide-leave-to {
  transform: translateX(-100%);
}

.slide-enter-to,
.slide-leave-from {
  transform: translateX(0);
}
</style>
