<template>
  <div v-if="isDrizzleInitialized">
    

   

    <h3>Display an Array</h3>
    <div class="flex-container">
      <div class="code">{{ sample.drugTrack.html }}</div>
      <drizzle-contract contractName="DrugTracking" method="drugTrack" />
    </div>
  </div>

  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'DrugArray',
  computed: {
    ...mapGetters('contracts', ['getContractData']),
    ...mapGetters('drizzle', ['isDrizzleInitialized']),
    drugTrack() {
      return this.getContractData({
        contract: 'DrugTracking',
        method: 'drugTrack'
      })
    },
  
  },
  data() {
    return {
      sample: {
        drugTrack: {
          html:
            '<drizzle-contract contractName="DrugTracking" method="drugTrack" />'
        },
      
    }
  }
}
}
</script>

<style scoped>
div.code {
  align-self: center;
}

div.flex-container {
  background-color: #c93b22;
  
  display: flex;
}

div.flex-container > div {
  flex: 1;
}

</style>