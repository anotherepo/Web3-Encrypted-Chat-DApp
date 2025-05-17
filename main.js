// Basic placeholder script

async function connectWallet() {
    if (window.ethereum) {
        const accounts = await ethereum.request({ method: 'eth_requestAccounts' });
        document.getElementById('app').innerText = 'Connected as: ' + accounts[0];
    } else {
        alert('Install MetaMask or Phantom!');
    }
}

window.onload = connectWallet;
