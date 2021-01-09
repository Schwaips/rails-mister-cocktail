import $ from 'jquery';
import 'select2';

$('#search').select2({data: cocktails, width: '100%' });



// on fetch l'api pour obtenir les résultats
const cocktailApi = (cocktail) => {
  fetch(`http://localhost:3000/cocktails.js`)
    .then(response => response.json())
    .then(iterationProposal);
};
