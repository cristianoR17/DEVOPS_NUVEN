# Not So Simple Ecommerce

Este é o repositório onde reside todo o código da aplicação `not-so-simple-ecommerce`.
A aplicação é composta por 6 microserviços no backend (.NET) e um frontend em React, todos devidamente dockerizados.

Este repositório deve ser utilizado para manipular as imagens das aplicações ou rodar a solução localmente.

---

## 🛠️ Configuração e Execução da Aplicação

### 1. Infra Stack

Primeiramente, execute o build da stack de infraestrutura, pois ela é a base para todas as demais stacks.

Essa stack realiza a criação dos seguintes contêineres:

- **LocalStack:** Tecnologia utilizada para replicar localmente diversos serviços da AWS.
- **Terraform:** Utilizado para criar a infraestrutura local da AWS no LocalStack.
- **Postgres:** Banco de dados relacional da aplicação `not-so-simple-ecommerce`.
- **Nginx:** Proxy reverso para agrupar diversas aplicações sob o mesmo domínio.

```bash
docker-compose -f docker-compose.infra.yml up -d
```

---

### 2. App Stack

A stack da aplicação é subdividida entre **workers** e **APIs**. Para rodá-las, execute o comando:

```bash
docker-compose -f docker-compose.workers.yml -f docker-compose.yml up -d
```

Acesse a aplicação em: [https://devopsnanuvem.internal:44300](https://devopsnanuvem.internal:44300)

📌 **Observação:** Se a aplicação não funcionar corretamente, consulte a seção de **Troubleshooting** abaixo.

---

### 3. Configuração do DNS e Certificados

Instale o certificado `root-ca.crt` na loja de certificados do seu Sistema Operacional conforme
instruções da aula **Aula 10-Docker Compose / Nginx (Proxy Reverso) / Certificate Store** do Módulo 02.

Caso precise regerar os certificados por qualquer motivo, execute o script bash dentro da pasta **cli**.

```bash
./cli/generate-certs.sh
```

📌 **Observação:** Atenção à senha do certificado, pois ela é utilizada na variável `ASPNETCORE_KESTREL__CERTIFICATES__DEFAULT__PASSWORD` no arquivo `.env`.

---

### 4. Testando a Aplicação

Se tudo estiver correto, você poderá acessar as seguintes URLs da aplicação:

- [Frontend](https://devopsnanuvem.internal:44300)
- [Main API](https://devopsnanuvem.internal:44300/main/swagger)
- [Order API](https://devopsnanuvem.internal:44300/order/swagger)
- [Identity API](https://devopsnanuvem.internal:44300/identity/swagger)
- [Health Checks API](https://devopsnanuvem.internal:44300/healthchecks/ui)
- [Invoice Worker API](https://devopsnanuvem.internal:44300/invoice/swagger)
- [Notificator Worker API](https://devopsnanuvem.internal:44300/notificator/swagger)

---

### 🚀 Testando o Fluxo da Aplicação

1. Crie um produto.
2. Crie um estoque para o produto.
3. Crie uma ordem consumindo o estoque do produto.

---

### 🗄️ Migrations

A aplicação utiliza **migrations**, o que significa que ao iniciar pela primeira vez, as aplicações se conectam automaticamente ao banco de dados e criam as tabelas e dados necessários para o funcionamento correto.

📌 **Dica:** Você pode verificar o processo conectando-se ao banco de dados e observando as tabelas geradas.

---
