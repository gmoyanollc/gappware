<h1>Welcome to gXslService</h1>
<p>gXslService provides capabilities accessible by XSL transformations and validations.</p>
<p>  
XSL functional programming and recursion may be daunting at times.  And, sticking with XSL may not be the best fit for certain tasks.</p>
<p>A good example is string manipulation.  String manipulation is a 
simple, basic task for most non-functional programming languages.  But, this task is a pain with XSL when recursion is necessary.</p>
<p>Caveats such as recursion often distance programmers from XSL altogether.  
However, XSL may be tamed with the help of a remote service.  XSL has the capability to request a remote service for a result during the XSL transformation or validation.</p>
<h2>Services Available</h2>
  <h3 id="lowerCamelCase">Convert_A_String to lowerCamelCase</h3>
  <p>Syntax: "string=" + ValueToConvert + "&delimiter=" + CharacterOrRegularExpressionWordDelimiter</p>
              <h4>Example:</h4>
              <p>  request: 
                <a id='aLowerCamelCaseRequest' href="/gxslservice/string/lowercamelcase?string=LOWER_CAMEL_CASE&delimiter=_" target="_blank">
                  <code id='codeLowerCamelCaseRequest'>
                    http://gappware-gmoyano.rhcloud.com/gxslservice/string/lowercamelcase?string=LOWER_CAMEL_CASE&delimiter=_ 
                  </code>
                </a>
              </p>
              <p>  response: </p>
<pre>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;response&gt;lowerCamelCase&lt;/response&gt;
  
</pre>

<h2>Deploy an instance of the gXslTransform Service</h2>

gXslTransform is implemented as an NodeJS HTTP service.  

Simply enter the following command to instantiate the service from a working folder:

	node server.js

That's it -- the beauty of NodeJS!

Now open your favorite web browser and enter the URL;

	http://localhost:5555
	
The included node.exe file is compiled for Microsoft Windows 64-bit.  On Windows 32-bit, running the provided node.exe file may throw an "Access Denied" the error.  To correct, simply download and replace the provided node.exe file with the 32-bit version at http://nodejs.org/download . 

Windows 32-bit and others may download Node.js from 

	http://nodejs.org/download
	
Linux users preferring package managers, see 

	https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

<h2>Example XSL Transformation</h2>

The example folder includes convertCase.xsl and EAFv2.8.xsd.  Also provided is an example output file, OutputEAFv2.8.xsd, containing expected results. 

The convertCase.xsl file drives the transformation process using values contained in variables declared at the top of the file.  The variable values may be modified to reuse the convertCase.xsl file to drive transformations for XML Schema files having different requirements.

The EAFv2.8.xsd file contains XML Element and Attribute Names described using UPPERCASE characters, delimited by the underscore character ('_').

