import { LightningElement } from 'lwc';
import getRandomRecipe from "@salesforce/apex/Spoonacular.getRandomRecipe";
import getRecipeByIngredient from "@salesforce/apex/Spoonacular.getRecipeByIngredient";

export default class RecipeSearch extends LightningElement {
    recipes =[]; 
    fetchRandomRecipe(){
        getRandomRecipe()
            .then((data)=>{
                this.recipes = JSON.parse(data) && JSON.parse(data).recipes ? JSON.parse(data).recipes :[];
            })
            .catch((error)=>{
                console.log('Error:', error);
            })
    }

    fetchRecipesByIngredients(){
        const ingredients = this.template.querySelector("lightning-input").value;
        getRecipeByIngredient({ingredients})
            .then((data)=>{
                this.recipes = JSON.parse(data);
            })
            .catch((error)=>{
                console.log('Error: ', error);

            })
    }




    
}