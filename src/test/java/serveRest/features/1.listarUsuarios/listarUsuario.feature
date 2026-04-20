@Regresion
@listarUsuarios
Feature: Listar usuarios

  Background:
    Given url baseurl


  Scenario: CP-007 - Validar el listado de todos los usuarios
    Given path '/usuarios'
    When method get
    Then status 200
    * def usuarioSchema = read('classpath:serveRest/schema/schemaListarUsuarios.json')
    And match each response.usuarios == usuarioSchema

