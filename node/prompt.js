const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const nodeVersions = {
    "1": "ghcr.io/parkervcp/yolks:nodejs_12",
    "2": "ghcr.io/parkervcp/yolks:nodejs_14",
    "3": "ghcr.io/parkervcp/yolks:nodejs_16",
    "4": "ghcr.io/parkervcp/yolks:nodejs_17",
    "5": "ghcr.io/parkervcp/yolks:nodejs_18",
    "6": "ghcr.io/parkervcp/yolks:nodejs_19",
    "7": "ghcr.io/parkervcp/yolks:nodejs_20",
    "8": "ghcr.io/parkervcp/yolks:nodejs_21"
};

const args = process.argv.slice(2);
const mode = args.includes('--mode=echo') ? 'echo' : 'env';

if (mode === 'echo') {
    console.log('Select Node.js version:');
    Object.keys(nodeVersions).forEach(key => {
        console.log(`${key}: ${nodeVersions[key]}`);
    });
    rl.question('Enter the number for the desired Node.js version: ', (answer) => {
        const selectedVersion = nodeVersions[answer];
        if (selectedVersion) {
            console.log(`Selected version: ${selectedVersion}`);
        } else {
            console.log('Invalid selection');
        }
        rl.close();
    });
} else if (mode === 'env') {
    console.log(process.env);
    rl.close();
}
