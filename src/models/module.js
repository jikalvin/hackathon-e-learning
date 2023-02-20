// Require the mongose library
const mongoose = require('mongoose');

const moduleSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true
    },
    // reference the instructor's object ID
    course: {
      type: mongoose.Schema.Types.ObjectId,
      ref: 'Course',
      required: true
    },
    linkPdf: {
        type: String,
        required: true
    },
    linkVideo: {
        type: String,
        required: true
    }
  },
  {
    timestamps: true
  }
);

const Module = mongoose.model('Module', courseSchema);
// Export the module
module.exports = Module;
