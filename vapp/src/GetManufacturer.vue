<template>
  <div>
   
    <div>
       <form>
        <input v-model="id" type="number" placeholder="manufacturer id" /> 
        <button @click.prevent="onSubmit">find</button>
       </form>
    </div>
    <div>
      <h2>manufacturer id :{{id}} 
          manufacturer name : {{name}}
          manufacturer account :{{account}}
      </h2>
    </div>
  </div>

  
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'GetManufacturer',

  computed: {
    ...mapGetters('contracts', ['getContractData']),
    ...mapGetters('drizzle', ['isDrizzleInitialized']),
    
  
  },
  methods:{
      onSubmit(id){
         
      return this.getContractData({
        contract: 'DrugTracking',
        method: 'manufacturers',
        methodsArgs:[id]
        
        
      }).then(
             manufacturer => {
                  this.id = manufacturer[0] ;
                  this.name = manufacturer[1];
                  this.account = manufacturer[2];

              }
          ) ;
         

      }

  },
  data(){
      return{
        
          id:'',
          name:'',
          account:''
      }

  }
}
</script>

<style></style>