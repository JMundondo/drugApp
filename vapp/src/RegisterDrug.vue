<template>
  <div v-if="isDrizzleInitialized">
    <div>
    <div class="yoo">
    <h1>Only Registered Manufacturer </h1>
    </div>
    <drizzle-contract
        contractName="DrugTracking"
        method="drugsCount"
        label="Number of Drugs in the System"
      />
       <h3>Registered Manufacturer</h3>
    <div class="flex-container">
      <div class="code">{{ sample.createdDrug.html }}</div>
      <drizzle-contract contractName="DrugTracking" method="createdDrug" />
    </div>
    
      
      <drizzle-contract-form
        contractName="DrugTracking"
        method="registerDrug"
        :placeholders="['serialNumber','ndc','name of drug','manufacturerName']"
      />
    </div>
  </div>

  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'RegisterDrug',

     computed: {
    ...mapGetters('contracts', ['getContractData']),
    ...mapGetters('drizzle', ['isDrizzleInitialized']),
       createdDrug() {
      return this.getContractData({
        contract: 'DrugTracking',
        method: 'createdDrug'
      })
    }
  },
   data() {
    return {
      sample: {
      
        createdDrug: {
          html:
            'Last Registered Manufacturer From the  BlockChain'
        }
      }
    }
  }

}
</script>

<style scoped>
div.yoo {
  background-color: #043112;
  text-align: center;
  
}
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