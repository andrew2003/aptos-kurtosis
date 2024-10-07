APTOS_CONTAINER_IMAGE = "sotazklabs/aptos-tools:mainnet"
APTOS_CONTAINER_SERVICE_NAME = "aptos-container"
APTOS_CONTAINER_API_PROTOCOL_NAME = "http"

APTOS_CONTAINER_TRANSACTION_NAME = "transaction"
APTOS_CONTAINER_FAUCET_NAME = "faucet"
APTOS_CONTAINER_API_NAME = "api"

APTOS_CONTAINER_TRANSACTION_PORT = 50051
APTOS_CONTAINER_FAUCET_PORT = 8081
APTOS_CONTAINER_API_PORT = 8080

WAIT_DISABLE = None

def run(plan):
    # Create the aptos_container:
        aptos_container_service = plan.add_service(
            name=APTOS_CONTAINER_SERVICE_NAME,
            config=ServiceConfig(
                image=APTOS_CONTAINER_IMAGE,
                ports={
                    APTOS_CONTAINER_API_NAME: PortSpec(
                        number=APTOS_CONTAINER_API_PORT,
                        application_protocol=APTOS_CONTAINER_API_PROTOCOL_NAME,
                        wait=WAIT_DISABLE,
                    ),
                    APTOS_CONTAINER_TRANSACTION_NAME: PortSpec(
                        number=APTOS_CONTAINER_TRANSACTION_PORT,
                        application_protocol=APTOS_CONTAINER_API_PROTOCOL_NAME,
                        wait=WAIT_DISABLE,
                    ),
                    APTOS_CONTAINER_FAUCET_NAME: PortSpec(
                        number=APTOS_CONTAINER_FAUCET_PORT,
                        application_protocol=APTOS_CONTAINER_API_PROTOCOL_NAME,
                        wait=WAIT_DISABLE,
                    ),

                },
                cmd=[
                    "aptos",
                    "node",
                    "run-localnet",
                    "--performance",
                ],
            ),
        )
