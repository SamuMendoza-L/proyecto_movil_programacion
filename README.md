# Proyecto móvil: navegación

## Integrantes y pantallas

| Integrante | Pantalla o responsabilidad |
| --- | --- |
| Samuel Mendoza | Login y navegación inicial hacia Cuenta. |
| María José Martínez | Cuenta / perfil. |
| Pendiente de registrar | Mis pedidos y su Pull Request. |

> **Pendiente para entrega:** completar el tercer integrante con su nombre, rama `navegacion/su-pantalla` y Pull Request fusionado por otra persona. Esta información no aparece en el historial local actual.

## Flujo de navegación

```text
[Login]
   └─ Navigator.push(userName) → [Login, Cuenta]
                                      └─ Navigator.push(userName) → [Login, Cuenta, Mis pedidos]
```

| Origen | Acción | Destino | Dato de ida | Pila resultante | Regreso |
| --- | --- | --- | --- | --- | --- |
| Login | `Iniciar sesión` o `Continuar con Google` | Cuenta | `userName: Camila Restrepo` en el constructor | `[Login, Cuenta]` | No aplica: Login es la primera pantalla. |
| Cuenta | `Mis pedidos` o pestaña `Pedidos` | Mis pedidos | `userName` en el constructor, visible como “Pedidos de …” | `[Login, Cuenta, Mis pedidos]` | Botón de la pantalla o Atrás del sistema con `Navigator.pop`. |
| Cuenta | Flecha superior, `Cerrar sesión` o pestaña `Inicio` | Login | No aplica | `[Login]` | `Navigator.pop`. |
| Mis pedidos | Flecha superior o `Volver a mi cuenta` | Cuenta | No aplica | `[Login, Cuenta]` | `Navigator.pop`. |

## Decisiones

- `Login` se declara como `home` en `main.dart`, al ser el inicio del flujo.
- Cada avance conserva la pila con `Navigator.push` y `MaterialPageRoute`; no se usa `pushReplacement`, por lo que el botón Atrás del sistema funciona de forma nativa.
- `Account` y `Orders` reciben `userName` mediante sus constructores. El dato se muestra en ambas pantallas para comprobar el paso de información.
- El cierre de sesión vuelve a Login con `Navigator.pop`, evitando abrir una segunda instancia de la pantalla inicial.

## Cambios respecto al diseño

- Se añadió la tercera pantalla **Mis pedidos**, necesaria para completar el flujo de tres pantallas.
- La cabecera de Login usa una ilustración creada con widgets en lugar de la fotografía de referencia.
- Se incorporaron flechas de regreso en Cuenta y Mis pedidos para cumplir el retorno explícito solicitado.

## Ayudas usadas

- **Codex (asistente de IA):** apoyo para construir widgets, estructurar las rutas con `Navigator` y revisar el análisis estático.
- **Flutter SDK:** ejecución de `flutter analyze` para validar el código.

## Verificación local

El flujo se puede recorrer como `Login → Cuenta → Mis pedidos → Cuenta → Login` sin vaciar la pila de navegación. Antes de entregar, ejecutar:

```bash
flutter pub get
flutter analyze
flutter run
```
