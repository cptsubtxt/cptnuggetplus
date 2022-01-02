
FROM golang:1.12-alpine as builder
WORKDIR /src
# The build context is set to the directory where the repo is cloned.
# This will copy all files in the repo to /app inside the container.
# If your app requires the build context to be set to a subdirectory inside the repo, you
#   can use the source_dir app spec option, see: https://www.digitalocean.com/docs/app-platform/references/app-specification-reference/
COPY . .
CMD ["server"]

# FROM klakegg/hugo:ext-alpine as builder
# WORKDIR /src
# # The build context is set to the directory where the repo is cloned.
# # This will copy all files in the repo to /app inside the container.
# # If your app requires the build context to be set to a subdirectory inside the repo, you
# #   can use the source_dir app spec option, see: https://www.digitalocean.com/docs/app-platform/references/app-specification-reference/
# COPY . .
# RUN npm i && hugo -D --gc

FROM klakegg/hugo:ext-alpine

RUN apk --no-cache add ca-certificates
WORKDIR /src

COPY --from=builder /src/public /src/public

CMD ["server"]