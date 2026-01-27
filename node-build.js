const fs = require('fs');
const https = require('https');
const { execSync } = require('child_process');

console.log('开始构建...');

// 下载Hugo
const url = 'https://github.com/gohugoio/hugo/releases/download/v0.154.5/hugo_extended_0.154.5_linux-amd64.tar.gz';
const file = fs.createWriteStream('hugo.tar.gz');

https.get(url, (response) => {
  response.pipe(file);
  file.on('finish', () => {
    file.close();
    console.log('Hugo下载完成');
    
    // 解压
    execSync('tar -xzf hugo.tar.gz', { stdio: 'inherit' });
    
    // 构建网站
    console.log('开始构建网站...');
    execSync('./hugo --minify', { stdio: 'inherit' });
    
    console.log('构建完成！');
  });
});
