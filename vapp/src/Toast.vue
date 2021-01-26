<template>
<h3>{{data}} {{eventName}}</h3>

    
</template>
<script>


export default {
    data(){
        return {
            eventName: '',
            data:''
        }
    },
    
    mounted(){
        const contractEventHandler = ({contractName , eventName , data}) =>{
            
    
          const display = `${contractName}(${eventName}):${data.newValue}`;
          alert(`${contractName}(${eventName}):${data.newValue}`) ;
          const subOptions = {duration:3000} ;
          this.$toasted.show(display , subOptions);
          this.eventName = eventName ;
          this.data = data ;
         
        

        
        }
        
        this.$drizzleEvents.$on('drizzle/contractEvents' , payload =>
       contractEventHandler(payload)  
        );
    
    }

}


</script>

 
<style scoped>

</style>