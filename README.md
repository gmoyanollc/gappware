**xsl-http-service** is an example service that demonstrates XSL transformation and XML validation remote requests.
 
Remote requests may be helpful during XSL functional programming and recursive processing.  At times XSL becomes daunting because it may not be the best tool for certain tasks.

A good example is string manipulation.  String manipulation is a simple, basic task for most non-functional programming languages.  But, this task can be painful to implement solely with XSL.

For example, let's say we have string value `LOWER_CAMEL_CASE` that requires transformation to __lowerCamelCase__ format. 

For a remote request in XSL:

```
  <xsl:value-of select="fn:doc(
  http://127.0.0.1:5555/xsl-http-service/string/lowercamelcase?string=LOWER_CAMEL_CASE&delimiter=_)
```

The service response is:

```
  <?xml version="1.0" encoding="utf-8"?>
  <response>lowerCamelCase</response>
```

# Getting Started

## Requirements

  * NodeJS
  * NodeJS Package Manager (NPM)

1. `git clone` or copy files to an empty project folder.

2. Open a terminal session in the project folder.

3. Enter `npm install` to install dependencies.

4. Enter `node server.js` to instantiate the http service.

5. Open a web browser.

6. Enter the URL `http://localhost:5555`.

# Example XSL Transformation

The file `convertCase.xsl` is included as an example XSL implementation. Its instructions are for XML Schema (XSD) files that have XML Element and Attribute Names described in UPPERCASE characters and words delimited by an underscore character ('_').  

The file `EAFv2.8.xsd` is provided as an example XML Schema file.  

The file `OutputEAFv2.8.xsd` is an example result from the transformation. 
