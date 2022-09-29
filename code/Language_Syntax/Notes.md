## Blocks

# ref
- terraform_site/language/syntax

# what is a block
- A block is a container for other content (code/configuration)
- A block has a type

# List of blocks
    - Terraform Settings Block
    - Provider Block
    - Resource Block
    - Input Variables Block
    - Output Values Block
    - Local Values Block
    - Data Sources Block
    - Module Block

# provider block is used to specify a provider configuration in which we pass some arguments such as region, profile
# resource block declares a resource of a given type(aws_instance) with a given local name(my_first_ec2). The name is used to refer to this resource from elsewhere in the same Terraform module, but has no significance outside the scope of this module.

# Template
<Block Type> "<Block Label Type>" "<Block Label>" {
    # Block body
    <!-- arguements -->
    <Identifier> = <Expression> # Argument
}

<!-- 
    resource "aws_instance" "my_first_ec2" {
        ami = "ami-2728923222423" #arguement
        instance_type = var.instance_type # Argument with value as expression (variable value replaced from variables.tf file)
        network_interface{
            #...
        }
    }
 -->

 - A block has a type (resource in this example). Each block type defines how many labels must follow the type keyword. The resource block type experts two lables, which are label type(eg. aws_instance) and label name (my_first_ec2) in example above. A particular block type may have any number if required labels, or it may require none as with the nested network_interface BLOCK TYPE

 - After the block type keyword and labels, the block body is delimited by { and } characters. Within the block body, further arguments and blocks may be nested, creating a hierarchy of blocks and their associated arguements.

 # Argument
 - They assign a value to an identifier name. They appear with blocks, Argument can be required or optional
<!-- eg. ami  -->

# Expression
- They represent a value, either literally or by referencing and combining other values. They appear as values for arguments, or within other expressions. They can also be a variable used in the expression to represent value
<!-- eg. "ami-2728923222423" -->

# Attributes
- They represent a named piece of data that belongs to some kind of object. The value of an attribute can be referenced in expressions using the dot-seperated notation, like aws_instance.example.id.
- The format looks like `resource_type.resource_name.attribute_name`

# Identifiers
- Argument names, block tyoe names, and the names of most Terraform-specific constructs like resources, input variables, etc. are all identifiers.

- Identifiers can contain letters, digits, underscores and hyphens. The first character of an identifier must not be a digit, to avoid ambiguity within literal numbers.

# Comments

- The terraform language supports three different syntaxes for comments

The # => single line comments
// => single line comments
/* */ => multi line comments
Most cases "#" is the default comment character and "//" maybe converted into "#" instead.

# Meta-Arguments