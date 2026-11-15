# Go Minimal Base Image

Imagem Docker minimalista para aplicações desenvolvidas em Go, utilizando `scratch` como imagem final para reduzir a superfície de ataque e o tamanho da distribuição.

## Link da imagem no HUB
https://app.docker.com/accounts/15253195

Executar a imagem (Docker Hub)
```bash
docker run -it 15253195/go-minimal-base:latest
```

## Características

- **Minimalista:** utiliza `scratch` como imagem final, sem sistema operacional adicional.
- **Multi-stage build:** separa o ambiente de compilação da imagem de execução.
- **CGO desabilitado:** gera binários independentes de bibliotecas C externas.
- **Binário otimizado:** remove símbolos de debug e informações desnecessárias.
- **Segurança:** reduz a quantidade de componentes presentes na imagem final.

## Tecnologias

- Go 1.27
- Docker
- Linux
- Scratch

## Build da imagem

Clone o repositório e execute:

```bash
docker build -t go-minimal-base:latest .
```

Ou executar direto a imagem do HUB

```bash
docker run -it 15253195/go-minimal-base:latest
```

Para verificar o tamanho da imagem:

```bash
docker image inspect go-minimal-base:latest \
  --format='{{.Size}} bytes'
```

## Executando a imagem

```bash
docker run --rm go-minimal-base:latest
```

A imagem executa o binário Go definido no `ENTRYPOINT`.

## Utilizando como imagem base

Para utilizar esta imagem em outro projeto, defina-a como imagem de execução no Dockerfile da aplicação:

```dockerfile
FROM go-minimal-base:latest

COPY --from=builder /app /app

ENTRYPOINT ["/app"]
```