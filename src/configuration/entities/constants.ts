export const Sitevariables = {
  home: {
    banner: [
      {
        key: "",
        image: "",
        heading: "",
        subHeading: "",
        ctaBtn: "",
        ctaLink: "",
      },
    ],
    section1: {
      count: "",
      heading: "",
      body: "",
      ctaBtn: "",
      ctaLink: "",
    },
    section2: {
      heading: "",
      body: "",
    },
    goingGreen: {
      heading: "",
      subheading: "",
      body: "",
      notes: "",
    },
    goingGreenImages: [
      {
        key: "",
        image: "",
      },
    ],
    counts: {
      established: "",
      locations: "",
      projects: "",
    },
    productRange: {
      heading: "",
      points: {
        heading: "",
        points: [],
      },
      ctaBtn: "",
      ctaLink: "",
    },
    productRangeImages: [
      {
        key: "",
        image: "",
      },
    ],
  },
  about: {
    banner: {
      key: "",
      image: "",
      heading: "",
      subHeading: "",
    },
    about: {
      key: "",
      image: "",
      heading: "",
      subHeading: "",
    },
    whyUs: {
      excellence: "",
      quality: "",
      experience: "",
      integrity: "",
      collaboration: "",
      customerFocus: "",
    },
  },
  turkey: {
    banner: {
      key: "",
      image: "",
      heading: "",
      subHeading: "",
    },
    section1: "",
    section2: "",
    turnkey: {
      key: "",
      image: "",
      heading: "",
      subHeading: "",
    },
  },
  productRange: {
    banner: {
      key: "",
      image: "",
      heading: "",
      subHeading: "",
    },
    imageSet: [
      {
        key: "",
        image: "",
      },
    ],
    products: [
      {
        heading: "",
        points: [],
        link: ""
      },
    ],
  },
  valves: {
    banner: [
      {
        key: "",
        image: "",
        heading: "",
        subHeading: "",
      },
    ],
    section1: {
      headingLeft: "",
      subHeadingLeft: "",
      headingRight: "",
      subHeadingRight: "",
    },
    section2: {
      key: "",
      image: "",
      heading: "",
      subHeading: "",
    },
    valves: [
      {
        heading: "",
        points: [],
      },
    ],
  },
  career: {
    subHeading: ""
  },
  contact: {
    country: [
      {
        key: "",
        heading: "",
        email: "",
        address1: "",
        address2: "",
        phone: "",
        countryIdentifier: "",
        mapElement: "",
      },
    ],
  },
  footer: {
    cmpny: {
      Name: "",
      City: "",
      Street: "",
      Country: "",
      Tel: "",
      Fax: "",
      Mail: "",
      Linkedin: "",
      Copyright: "",
    },
  },
};

// export function fillDefaults(input, template) {
//   if (Array.isArray(template)) {
//     return Array.isArray(input) ? input.map((item, index) => fillDefaults(item, template[0])) : [];
//   } else if (typeof template === 'object' && template !== null) {
//     return Object.keys(template).reduce((acc, key) => {
//       acc[key] = key in input ? fillDefaults(input[key], template[key]) : template[key];
//       return acc;
//     }, {});
//   }
//   return typeof input === typeof template ? input : template;
// }

export function fillDefaults(input, template) {
  if (Array.isArray(template)) {

    return Array.isArray(input)
      ? template.length === 0
        ? input
        : input.map((item, index) => fillDefaults(item, template[0]))
      : [];
  } else if (typeof template === "object" && template !== null) {
    return Object.keys(template).reduce((acc, key) => {
      // Ensure input is an object before checking "key in input"
      if (input && typeof input === "object" && key in input) {
        acc[key] = fillDefaults(input[key], template[key]);
      } else {
        acc[key] = template[key]; // Use default if key is missing
      }
      return acc;
    }, {});
  }

  return typeof input === typeof template ? input : template;
}
