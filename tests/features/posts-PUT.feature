Feature: /posts/put/{idPost} PUT

    Actualizar los posts en el Sitio Web.

    Scenario: /put/{idPost} 200 ok.

        Given I set Content-Type header to application/json
        And I set body to {"titulo": "Title","cuerpo": "Body"}
        When I PUT `apigeeDomain`/`deploymentSuffix`/put/<idPost>

        Then response code should be 200
        And response body should be valid json

        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.resultado.idPost should be ^([0-9])*$

        Examples:
            | idPost |
            | 1      |

    Scenario: /put/{idPost} 400 bad request.

        When I PUT `apigeeDomain`/`deploymentSuffix`/put/<idPost>

        Then response code should be 400
        And response body should be valid json
        And response body path $.codigo should be ^400\.Sitio-Web\.\d{4}$
        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.detalles[*] should be ([A-Za-z])+.\w+

        Examples:
            | idPost |
            | abcde  |

    Scenario: /put/{idPost} 404 not found.

        When I PUT `apigeeDomain`/`deploymentSuffix`/put/<idPost>

        Then response code should be 404
        And response body should be valid json
        And response body path $.codigo should be ^404\.Sitio-Web\.\d{4}$
        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.detalles[*] should be ([A-Za-z])+.\w+

        Examples:
            | idPost |
            | 1234   |

    Scenario: /put/{idPost} 500 internal server error.

        When I PUT `apigeeDomain`/`deploymentSuffix`/put/<idPost>

        Then response code should be 500
        And response body should be valid json
        And response body path $.codigo should be ^500\.Sitio-Web\.\d{4}$
        And response body path $.mensaje should be ([A-Za-z])+.\w+
        And response body path $.folio should be ^[A-z-0-9]{0,}$
        And response body path $.detalles[*] should be ([A-Za-z])+.\w+

        Examples:
            | idPost |
            | null   |