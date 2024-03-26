# 指定使用Node.js 20.11.1版本的官方镜像作为基础镜像
FROM --platform=linux/amd64 node:20.11.1

# 设置工作目录，后续的命令都在该目录下执行
WORKDIR /usr/src/app

# 复制package.json和yarn.lock文件到工作目录中
COPY package.json yarn.lock ./

# 安装第三方依赖包
RUN yarn install --frozen-lockfile

# 复制源代码到工作目录中（除了node_modules和Dockerfile）
COPY . .

# 做配置文件的占位符，方便后续运行时以volume绑定或复制
# RUN touch /usr/src/app/config.json


# 运行你的node应用
CMD ["node", "main.js"]
