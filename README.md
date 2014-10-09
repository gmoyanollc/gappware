<h1>Welcome to gXslService</h1>
<p>gXslService provides services intended for XSL transformations and validations.</p>
<p>  
XSL functional programming and recursion may be daunting for many.  At times, constraining oneself to XSL 
is much like using a flat-head screwdriver to screw a Phillips fastener.   It's possible, but difficult.  
Using XSL for string manipulation is an example where many times recursion gets in the way of coding a simple task using a non-functional programming language.  
Caveats such as recursion often distance programmers from XSL altogether.  
<p>Rather than forego powerful XSL transformation capabilities altogether, a remote service can perform
a function and return a result for an XSL transformation or validation.</p>
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
