// URL de base de l'API
//const API_URL = "http://localhost:3000/api"; // Version locale
const API_URL = "https://tp-final-sw.onrender.com/api";

/**
 * fonction pour affiche le resultat de l'inscription dans la page 
 * @param {Object} data donnees retournees par l'API
 */
function afficherResultatInscription(data) {
    const div = document.getElementById('resultat-inscription');
    div.innerHTML = "";
    if (data.erreur) {
        div.innerHTML = `<p class="erreur">${data.erreur}</p>`;
        return;
    }
    div.innerHTML = `
        <p class="succes">${data.message}</p>
        <p><strong>Cle API :</strong> ${data.cle_api}</p>
    `;
}

/**
 * fonction pour affiche la cle API recuperee ou generee dans la page
 * @param {Object} data donnees retournees par l'API
 */
function afficherResultatCleApi(data) {
    const div = document.getElementById('resultat-cle-api');
    div.innerHTML = "";
    if (data.erreur) {
        div.innerHTML = `<p class="erreur">${data.erreur}</p>`;
        return;
    }
    div.innerHTML = `<p><strong>Cle API :</strong> ${data.cle_api}</p>`;
}

/**
 * fonction pour creer un nouveau compte utilisateur
 */
async function inscrire() {
    const nom = document.getElementById('inscription-nom').value;
    const courriel = document.getElementById('inscription-courriel').value;
    const password = document.getElementById('inscription-password').value;
    const urlPost = `${API_URL}/bibliotheque/inscription`;
    try {
        const reponse = await fetch(urlPost, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=utf-8'
            },
            body: JSON.stringify({ nom, courriel, password })
        });
        if (!reponse.ok) {
            console.error('Erreur HTTP:', reponse.status);
        }
        const data = await reponse.json();
        afficherResultatInscription(data);
    } catch (err) {
        console.error('Erreur reseau:', err);
    }
}

/**
 * fonction pour obtenir sa cle API (existante ou nouvelle)
 */
async function recupererCleApi() {
    const courriel = document.getElementById('cle-courriel').value;
    const password = document.getElementById('cle-password').value;
    const nouvelle = document.getElementById('nouvelle-cle').checked;
    let url = `${API_URL}/bibliotheque/cle-api`;
    if (nouvelle) {
        url += '?nouvelle=true';
    }
    try {
        const reponse = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ courriel, password })
        });
        if (!reponse.ok) {
            console.error('Erreur HTTP:', reponse.status);
        }
        const data = await reponse.json();
        afficherResultatCleApi(data);
    } catch (err) {
        console.error('Erreur reseau:', err);
    }
}

// evenements
document.getElementById('btn-inscription').addEventListener('click', inscrire);
document.getElementById('btn-recuperer').addEventListener('click', recupererCleApi);