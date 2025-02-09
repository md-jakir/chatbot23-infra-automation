package test

import (
	"fmt"
	"testing"
	"github.com/gruntwork-io/terratest/modules/terraform"
	//"github.com/stretchr/testify/assert"
)

func TestTerraformDeployment(t *testing.T) {
	t.Parallel()

	// Define Terraform options with the "-var-file" flag
	terraformOptions := &terraform.Options{
		TerraformDir: "../", // Adjust to your Terraform directory
		Vars: map[string]interface{}{},
		VarFiles: []string{"dev.tfvars"}, // <-- Pass the tfvars file here
	}

	// Ensure Terraform init, apply
	terraform.InitAndApply(t, terraformOptions)

	// Interactive Destroy Confirmation
	fmt.Println("Do you want to destroy resources after the test? (y/n)")
	var response string
	fmt.Scanln(&response)
	if response == "y" {
		terraform.Destroy(t, terraformOptions)
	}

	// Validate output
	// expectedValue := "some-expected-output"
	// actualValue := terraform.Output(t, terraformOptions, "some_output_variable")
	// assert.Equal(t, expectedValue, actualValue)
}
