Para permitir que varios usuarios puedan contribuir a un repositorio en GitHub, deben seguir estos pasos:

## 1. Hacer Fork del Repositorio

1. Inicia sesión en tu cuenta de GitHub.
2. Ve al repositorio original en GitHub: [sc-workshop-play](https://github.com/leandroyako/sc-workshop-play-tp).
3. Haz clic en el botón **Fork** en la esquina superior derecha. Esto creará una copia del repositorio en tu cuenta de GitHub.

## 2. Clonar el Repositorio Forkeado

1. Ve a tu repositorio forkeado en tu cuenta de GitHub.
2. Haz clic en el botón **Code** y copia la URL del repositorio.
3. Abre una terminal en tu computadora y ejecuta el siguiente comando para clonar el repositorio:

```bash
git clone <URL_DE_TU_REPOSITORIO_FORK>
```

Sustituye `<URL_DE_TU_REPOSITORIO_FORK>` con la URL que copiaste en el paso anterior.

## 3. Crear una Rama Nueva

1. Navega al directorio del repositorio clonado:

```bash
cd sc-workshop-play-tp
```

2. Crea una nueva rama para tus cambios:

```bash
git checkout -b <nombre-de-tu-rama>
```

Sustituye `<nombre-de-tu-rama>` con un nombre descriptivo para tu rama.

## 4. Hacer Cambios y Commit

1. Realiza los cambios necesarios en tu repositorio local.
2. Agrega los archivos modificados al área de preparación:

```bash
git add .
```

3. Haz commit de tus cambios:

```bash
git commit -m "Descripción de los cambios"
```

## 5. Push de los Cambios a tu Repositorio Forkeado

1. Sube tus cambios a tu repositorio forkeado en GitHub:

```bash
git push origin <nombre-de-tu-rama>
```

## 6. Crear un Pull Request

1. Ve a tu repositorio forkeado en GitHub.
2. Deberías ver un mensaje que te indica que has subido una nueva rama y te ofrece la opción de crear un Pull Request.
3. Haz clic en **Compare & pull request**.
4. Proporciona una descripción clara de los cambios que has realizado y haz clic en **Create pull request**.

## 7. Revisión y Fusión del Pull Request

1. Los mantenedores del repositorio original revisarán tu Pull Request.
2. Una vez aprobado, fusionarán tus cambios en el repositorio principal.
