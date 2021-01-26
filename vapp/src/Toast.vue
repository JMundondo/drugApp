<template>
<section></section>

    
</template>
<script>
//import { generateStore, EventActions } from '@drizzle/store';

//import  Toasted from 'vue-toasted';
//import Vue from 'vue';
//Vue.use('Toasted');




export default {
    name: 'Toast',
  
    
    mounted(){
     /*   const contractEventNotifier = store => next => action => {
  if (action.type === EventActions.EVENT_FIRED) {
    const contract = action.name
    const contractEvent = action.event.event
    const message = action.event.returnValues._message
    const display = `${contract}(${contractEvent}): ${message}`

    toast.success(display, { position: toast.POSITION.TOP_RIGHT })
  }
  return next(action)
}*/
        const contractEventHandler = ({contractName , eventName , data}) =>{
            
         if(eventName == 'registerManufacturers'){
           

            const display = `${contractName}(${eventName}):${data._names} , ${data._accounts}`;
          alert(`${contractName}(${eventName}):${data._names} , ${data._accounts}`) ;
          const subOptions = {duration:3000} ;
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

 
<style scoped>

</style>