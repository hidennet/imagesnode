const args = process.argv.slice(2);
const mode = args.includes('--mode=env') ? 'env' : 'echo';

if (mode === 'env') {
  console.log('export VAR_NAME=value');
} else {
  console.log('echo mode');
}
