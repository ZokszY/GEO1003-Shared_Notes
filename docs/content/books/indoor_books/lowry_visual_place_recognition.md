## Visual Place Recognition <br>

### Key Components
- Image processing module: interpret visual data
  - Object recognition in images also help to contextualise the location
    - Eg: stove, fridge and sink indicate the place is likely a kitchen
  - Local feature descriptors: detect local interest points in an image, describe and store them as words
    - Bag-of-words model then compares the collection of word descriptors with the map (trained with places also described by bag-of-words) to match a place
    - Local features do not take the overall geometry into account
      - Thus pose-invariant: place is recognizable regardless of the position/orientation of the source image
      - However, adding geometric information improves robustness of place matching
  - Global feature descriptors: create a fingerprint of a location based on detected features
    - Uses color histograms, feature detection (edges, corners, color patches)
    - These features are ordered from $0^o$ to $360^o$ into a fingerprint, using omni-directional cameras during training phase
    - Assumes the input live data is at similar height/location of the training data
  - Generally, combining both local and global descriptors provides the best results
- Map: maintains a representation of knowledge of the world
  - Usually a relational (topological/cognitive) map rather than absolute/geometric positioning
  - Consists of bounded places
    - Place signature: set of visual information that distinguishes it from other places
    - Gateway: physical boundaries of a place, where the physical appearances changes significantly
  - Methods:
    - Pure image retrieval: matching based only on image similarities, no position information is required/given
    - Pure topological map: stores relative positions of places, no metric information stored
      - Speeds up searching as indexing is possible
    - Topological-metric / Topometric map: enhance topological maps with direction and/or distance
      - Appearance-based option: metric information only between places, not within places
      - Sparse landmark option: metric information extracted from depth values between key landmarks inside the image
      - Dense occupancy grid option: same as sparse landmark but for more feature points, more GPU/memory-intensive  
- Belief generation: combines information from above components to make decision on place familiarity
  - Bag-of-words model: TF-IDF scoring (term frequency - inverse document frequency)
    - Each visual word in image is scored by frequency of it appearing in image, against how common the word is across all images
  - Voting scheme: use multiple data streams to vote confidence of matching
    - Eg: multiple color bands that give unanimous voting and confidence value > threshold
  - Artifical neural network: Continuous attractor network (CAN)
    - Mimic neural network of a rat hippocampus using local excitation and global inhibition layers

### Changing Environments
- Image processing module:
  - Invariant methods: focus on features that are invariant despite changing environments
    - Eg: edges and corners remain prominent despite lighting changes
    - This is also true for convolutional neural networks: mid-level features are robust to changes in the environment
    - Alternatively, use training images that are as 'change-invariant' as possible, or pre-process live data to reduce changes
  - Learning methods: define the relationship between how a place can appear across different times
    - Eg: use pairs of images between two different seasons, or day and night
- Map: how to deal with different representations of the same place
  - Remember and forget: Balance between new observations (that may be fleeting/inconsequential) and overwriting obsolete information
  - Multiple representations of the same environment: to capture cyclic/regular changes in environment
    - Eg: seasonal changes are cyclic
    - Store information of the same place (or whole-map level) at different instances of the required timescale
