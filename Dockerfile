# FROM klakegg/hugo:ext-alpine as builder
# WORKDIR /src
# # The build context is set to the directory where the repo is cloned.
# # This will copy all files in the repo to /app inside the container.
# # If your app requires the build context to be set to a subdirectory inside the repo, you
# #   can use the source_dir app spec option, see: https://www.digitalocean.com/docs/app-platform/references/app-specification-reference/
# COPY . .
# RUN npm i && hugo -D --gc

FROM klakegg/hugo:ext-alpine

WORKDIR /src