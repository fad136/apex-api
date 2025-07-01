import { LightningElement } from 'lwc';

export default class BreakingBadQuotes extends LightningElement {

    quote = ''
    author = '';
    authorImage = '';

    connectedCallback() {
        this.fetchQuotes();
    }

    fetchQuotes() {
        // Remember to add the endpoint to the Trusted URLs, allowing the connect-src setting
        fetch('https://api.breakingbadquotes.xyz/v1/quotes')
            .then(response => response.json())
            .then(data => {
                this.authorImage = '';
                
                console.log(data);
                this.quote = data[0].quote;
                this.author = data[0].author;

                //add the https://upload.wikimedia.org & https://static.wikia.nocookie.net to the Trusted URLs, allowing the image-src and frame-src setting
                if (data[0].author === 'Jesse Pinkman') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c6/Jesse_Pinkman_S5B.png/250px-Jesse_Pinkman_S5B.png';
                } else if (data[0].author === 'Walter White') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Walter_White_S5B.png/250px-Walter_White_S5B.png';
                } else if (data[0].author === 'Gustavo Fring') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/en/thumb/6/69/Gustavo_Fring_BCS_S3E10.png/250px-Gustavo_Fring_BCS_S3E10.png';
                } else if (data[0].author === 'Mike Ehrmantraut') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/en/thumb/e/ea/Mike_Ehrmantraut_BCS_S3.png/250px-Mike_Ehrmantraut_BCS_S3.png';
                } else if (data[0].author === 'Saul Goodman') {
                    this.authorImage = 'https://static.wikia.nocookie.net/breakingbad/images/e/e0/Saul_2009.jpg/';
                } else if (data[0].author === 'Skyler White') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/en/thumb/f/fb/Skyler_White_S5B.png/250px-Skyler_White_S5B.png';
                } else if (data[0].author === 'Badger') {
                    this.authorImage = 'https://static.wikia.nocookie.net/breakingbad/images/5/5b/Cast_bb_800x600_badger.jpg/';
                } else if (data[0].author === 'The fly') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/commons/6/60/Fly_flies_insect.jpg';
                } else if (data[0].author === 'Hank Schrader') {
                    this.authorImage = 'https://static.wikia.nocookie.net/breakingbad/images/b/b7/HankS5.jpg/';
                } else if (data[0].author === 'Walter White Jr.') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/en/c/ce/Walter_White_Jr_S5B.png';
                } else if (data[0].author === 'Gale Boetticher') {
                    this.authorImage = 'https://static.wikia.nocookie.net/breakingbad/images/4/4c/Cast_bb_800x600_gale-boetticher.jpg';
                } else if (data[0].author === 'Tuco Salamanca') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Raymond_Cruz_February_2015.jpg/1200px-Raymond_Cruz_February_2015.jpg';
                } else if (data[0].author === 'Todd') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Jesse_Plemons_%2820769593584%29_%28cropped%29.jpg/1200px-Jesse_Plemons_%2820769593584%29_%28cropped%29.jpg';
                } else if (data[0].author === 'Uncle Jack') {
                    this.authorImage = 'https://static.wikia.nocookie.net/totalwar-ar/images/c/c2/Jack_Welker.jpg';
                } else if (data[0].author === 'Tio Salamanca') {
                    this.authorImage = 'https://static.wikia.nocookie.net/breakingbad/images/3/34/TioSalamanca.jpg';
                } else if (data[0].author === 'Marie Schrader') {
                    this.authorImage = 'https://upload.wikimedia.org/wikipedia/en/c/cb/Marie_Schrader_S5B.png';
                }
            })
            .catch(error => console.error('Error fetching quotes:', error));
    }
}
