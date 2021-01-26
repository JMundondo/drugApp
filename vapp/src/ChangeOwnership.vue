<template>
  <div v-if="isDrizzleInitialized">
    <div>
   
      <drizzle-contract-form
        contractName="DrugTracking"
        method="changeOwnership"
        :placeholders="['serailNumber','new owner Address']"
      />
    </div>
  </div>

  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'ChangeOwnership',

  computed: mapGetters('drizzle', ['isDrizzleInitialized'])
}
</script>

<style></style>