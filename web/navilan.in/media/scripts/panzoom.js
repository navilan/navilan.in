function initializePanAndZoom() {
    document.querySelectorAll('.zoomable').forEach(container => {
        const zoomableImage = container.querySelector('img');
        let currentTransform = d3.zoomIdentity;

        const zoom = d3.zoom()
            .scaleExtent([1, 5])
            .on("zoom", (event) => {
                currentTransform = event.transform;
                zoomableImage.style.transform = `translate(${event.transform.x}px, ${event.transform.y}px) scale(${event.transform.k})`;
            });

        const resetZoom = () => {
            currentTransform = d3.zoomIdentity;
            d3.select(container).transition().call(zoom.transform, currentTransform);
        };

        d3.select(container).call(zoom);

        function updateFullscreenButton(button, isFullscreen) {
            const svgPath = isFullscreen
                ? "M5 5v6h2V7h4V5H5zm14 0h-6v2h4v4h2V5zm-6 14h6v-6h-2v4h-4v2zm-8-6H5v6h6v-2H7v-4z"
                : "M7 7h4V5H5v6h2zm10 0h4v4h-2V7h-2zm0 10v4h4v-6h-2v4h-2zm-10 0H5v4h6v-2H7v-2z";
            button.querySelector('path').setAttribute('d', svgPath);
        }

        function addControlButtons() {
            const controlButtons = document.createElement('div');
            controlButtons.classList.add('control-buttons');

            controlButtons.innerHTML = `
                <button class="zoomIn">
                    <svg viewBox="0 0 24 24"><path d="M12 7v5H7v2h5v5h2v-5h5v-2h-5V7z"></path></svg>
                </button>
                <button class="zoomOut">
                    <svg viewBox="0 0 24 24"><path d="M7 11h10v2H7z"></path></svg>
                </button>
                <button class="resetZoom">
                    <svg viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zM11 7v6l5.25 3.15.75-1.23-4.5-2.67V7H11z"></path></svg>
                </button>
                <button class="toggleFullscreen">
                    <svg viewBox="0 0 24 24"><path d="M7 7h4V5H5v6h2zm10 0h4v4h-2V7h-2zm0 10v4h4v-6h-2v4h-2zm-10 0H5v4h6v-2H7v-2z"></path></svg>
                </button>
            `;

            container.appendChild(controlButtons);

            const containerSelection = d3.select(container);
            const fullscreenButton = controlButtons.querySelector('.toggleFullscreen');

            controlButtons.querySelector('.zoomIn').addEventListener('click', () => {
                containerSelection.transition().call(zoom.scaleBy, 1.2);
            });

            controlButtons.querySelector('.zoomOut').addEventListener('click', () => {
                containerSelection.transition().call(zoom.scaleBy, 0.8);
            });

            controlButtons.querySelector('.resetZoom').addEventListener('click', resetZoom);

            fullscreenButton.addEventListener('click', () => {
                const isFullscreen = container.classList.toggle('fullscreen');
                updateFullscreenButton(fullscreenButton, isFullscreen);
            });
        }

        addControlButtons();
    });
}
