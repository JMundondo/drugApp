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

  computed: mapGetters('drizzle', ['isDrizzleInitialized']) ,
  mounted(){
  
        const contractEventHandler = ({contractName , eventName , data}) =>{
            
         if(eventName == 'changeOwnerships'){
           

     const display = `${contractName}(${eventName}):${data._serialNumbers} , ${data._oldOwners} ,${data._newOwners}`;
          
    const subOptions = {duration:6000} ;
    this.$toasted.show(display , subOptions);
         }
         
          
        

        
        }
        
        this.$drizzleEvents.$on('drizzle/contractEvent' , payload =>{
        contractEventHandler(payload) ;
        
        }
        
        );
    
    },
}
</script>

<style></style>