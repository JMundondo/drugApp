<template>
  <div v-if="isDrizzleInitialized">
    <div>
    <drizzle-contract
        contractName="DrugTracking"
        method="manufacturersCount"
        label="Number Of registered Manufacturers"
      />
       <h3>Registered Manufacturer</h3>
    <div class="flex-container">
      <div class="code">{{ sample.createdManufacturer.html }}</div>
      <drizzle-contract contractName="DrugTracking" method="createdManufacturer" />
    </div>
    <div>
     <h1>Only Owner Can Register</h1>
    </div>
      
      <drizzle-contract-form
        contractName="DrugTracking"
        method="registerManufacturer"
        :placeholders="['id','name','account']"
      />
    </div>
  </div>

  <div v-else>Loading...</div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'RegisterManufacturer',
 // computed:mapGetters('drizzle', ['isDrizzleInitialized'])

   computed: {
    ...mapGetters('contracts', ['getContractData']),
    ...mapGetters('drizzle', ['isDrizzleInitialized']),
       createdManufacturer() {
      return this.getContractData({
        contract: 'DrugTracking',
        method: 'createdManufacturer'
      })
    }
  },
   data() {
    return {
      sample: {
      
        createdManufacturer: {
          html:
            'Last Created Manufacturer From the  BlockChain'
        }
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
